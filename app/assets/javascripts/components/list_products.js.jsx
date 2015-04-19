var ListProducts = React.createClass({
    getInitialState: function() {
      return {
        greeting: this.props.name,
        rows: [],
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
          <li><a id="RTS-category" onClick={this.handleCategoryChange}>RTS</a></li>
          <li><a id="RPG-category" onClick={this.handleCategoryChange}>RPG</a></li>
          <li>Category3</li>
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