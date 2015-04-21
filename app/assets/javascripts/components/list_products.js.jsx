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

    render: function() {
        return <div>
        <div className="col-md-4">
        <ul>
          {this.state.categories_rows}
        </ul>
        </div>
        <div className="col-md-4" role="search">
        <ul>
        {this.state.rows}
        </ul>
            <input id="search-input" type="text" className="form-control" placeholder="Search" ></input>
            <button onClick={this.handleSearchButton} id="search-btn" type="button" className="btn btn-default">Search</button>
        </div>
          </div>
          
          
    }
});