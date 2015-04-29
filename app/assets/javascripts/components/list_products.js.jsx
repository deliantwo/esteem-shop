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
          temp.push(<div className="panel panel-default"><div className="panel-body"><h2 className="nomargin"><a href={'games/' + element.id}>{element.name}</a></h2><p>Kategoria: <i><a href="#">{element.category}</a></i></p><p>{element.description}</p><h2 className="nomargin text-right"><small>Cena:</small>{element.price + " zł"}</h2></div></div>)
          global_this.setState({rows: temp})
    });
      })
      for(var i=0;i<this.state.categories.length;i++) {
        var temp = global_this.state.categories_rows
        temp.push(<a className="list-group-item" id={this.state.categories[i].name + "-category"} onClick={this.handleCategoryChange}>{this.state.categories[i].name}</a>)
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
          temp.push(<div className="panel panel-default"><div className="panel-body"><h2 className="nomargin"><a href={'games/' + element.id}>{element.name}</a></h2><p>Kategoria: <i><a href="#">{element.category}</a></i></p><p>{element.description}</p><h2 className="nomargin text-right"><small>Cena:</small>{element.price + " zł"}</h2></div></div>)
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
          temp.push(<div className="panel panel-default"><div className="panel-body"><h2 className="nomargin"><a href={'games/' + element.id}>{element.name}</a></h2><p>Kategoria: <i><a href="#">{element.category}</a></i></p><p>{element.description}</p><h2 className="nomargin text-right"><small>Cena:</small>{element.price + " zł"}</h2></div></div>)
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
            {this.state.categories_rows}
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
          
          {this.state.rows}

        </div>
          </div>
          
          
    }
});