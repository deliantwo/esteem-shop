var ListProducts = React.createClass({
    getInitialState: function() {
      return {
        greeting: this.props.name,
        products: this.props.products,
        rows: [],
        search_active: false
      };
    },
    testAjaxSearch: function (action ) {
      var global_this = this
      this.props.rows = [];
      var temprows = [];
      var json_getter = $.getJSON( "search.json", function( data ) {
        $.each(data, function(index, element) {
          temprows.push(element.name);
        $('body').append($('<div>', {
            text: JSON.stringify(element.name)
        }));
    });
      })
      json_getter.complete(function() {
        for (var i=0; i<temprows.length; i++){
          global_this.props.rows.push(<li> {temprows[i]} </li>)
        }
        global_this.setState({greeting: 'dupa2'})
      });
    },
  handleSearchButton: function() {
      var global_this = this
      var category_name = event.target.text
      this.setState({rows: []})
      var search_value = $("#search-input").val();
      var json_getter = $.getJSON( "search.json?name=" + search_value, function( data ) {
        $.each(data, function(index, element) {
          var temp = global_this.state.rows
          temp.push(<li> {element.name} </li>)
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
          temp.push(<li> {element.name} </li>)
          global_this.setState({rows: temp})
    });
      })
    },

    render: function() {
        return <div>
        <div className="col-md-3">
        <ul>
        <li>{this.state.greeting}</li>
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
            <button onClick={this.testAjaxSearch} id="search-btn2" type="button" className="btn btn-default">Search2</button>
        </div>
          </div>
          
          
    }
});