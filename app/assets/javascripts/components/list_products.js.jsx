var ListProducts = React.createClass({
    getInitialState: function() {
      return {
        greeting: this.props.name,
        rows: [],
        categories_rows: [],
        categories: this.props.categories,
        search_active: false
      };
    },
    componentDidMount: function (action ) {
      var global_this = this
      this.setState({rows: []})
      var json_getter = $.getJSON( "search.json", function( data ) {
        $.each(data, function(index, element) {
          var temp = global_this.state.rows
          temp.push(<a href={'games/' + element.id}><li> {element.name} </li></a>)
          global_this.setState({rows: temp})
    });
      })
      for(var i=0;i<this.state.categories.length;i++) {
        var temp = global_this.state.categories_rows
        temp.push(<li><a id={this.state.categories[i].name + "-category"} onClick={this.handleCategoryChange}>{this.state.categories[i].name}</a></li>)
        global_this.setState({categories_rows: temp})
      }
    },
  handleSearchButton: function() {
      var global_this = this
      var category_name = event.target.text
      this.setState({rows: []})
      var search_value = $("#search-input").val();
      var json_getter = $.getJSON( "search.json?name=" + search_value, function( data ) {
        $.each(data, function(index, element) {
          var temp = global_this.state.rows
          temp.push(<a href={'games/' + element.id}><li> {element.name} </li></a>)
          global_this.setState({rows: temp})
    });
      })
    },
    
    handleCategoryChange: function(event) {
      var global_this = this
      var category_name = event.target.text
      this.setState({rows: []})
      var search_value = $("#search-input").val();
      var json_getter = $.getJSON( "search.json?name=" + search_value +"&category=" + category_name, function( data ) {
        $.each(data, function(index, element) {
          var temp = global_this.state.rows
          temp.push(<a href={'games/' + element.id}><li> {element.name} </li></a>)
          global_this.setState({rows: temp})
    });
      })
    },
    
    formattedColumns: function() {
      var html = "";
      for(var i = 0; i < this.state.categories_rows.length; ++i)
      {
        html += "<a className=\"list-group-item\">this.state.categories_rows[i].name</a>";
      }
      return html;
    },

    render: function() {
        return <div className="row">
        <div className="col-md-3">
          <div className="list-group">
            <span className="list-group-item">Kategorie</span>
            <a className="list-group-item" href="#">RTS</a>
            <a className="list-group-item" href="#">Inny crap</a>
          </div>
        </div>
        <div className="col-md-8">
          <div className="input-group" role="search">
            <input id="search-input" type="text" className="form-control" placeholder="Search"></input>
            <span className="input-group-btn">
              <button onClick={this.handleSearchButton} id="search-btn" type="button" className="btn btn-default">Search</button>
            </span>
          </div>
          
          <h1>Polecane gry</h1>
          
          <div className="panel panel-default">
            <div className="panel-body">
              <h2 className="nomargin">Plague Inc</h2>
              <p>Kategoria: <i><a href="#">RTS</a></i></p>
              <p>Opis gry tutaj powinien być</p>
              <h2 className="nomargin text-right"><small>Cena:</small> 100zł</h2>
            </div>
          </div>
          
          <div className="panel panel-default">
            <div className="panel-body">
              <h2 className="nomargin">Inne coś</h2>
              <p>Kategoria: <i><a href="#">RTS</a></i></p>
              <p>Opis gry tutaj powinien być</p>
              <h2 className="nomargin text-right"><small>Cena:</small> 85zł</h2>
            </div>
          </div>
          <ul>
            {this.state.rows}
          </ul>
        </div>
          </div>
          
          
    }
});