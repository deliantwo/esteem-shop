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
          temp.push(<div onClick={global_this.handleRedirect} id={"game-" + element.id} className="panel panel-default game-item"><div id={"gamebody1-" + element.id} className="panel-body"><h2 id={"gamebody2-" + element.id} className="nomargin"><span id={"gamebody3-" + element.id} className="game-item-link">{element.name}</span></h2><p id={"gamebody4-" + element.id}>Kategoria: <i><span id={"gamebody5-" + element.id} className="game-item-category" href="#">{element.category}</span></i></p><p><span id={"gamebody6-" + element.id} className="game-item-desc">{element.description}</span></p><h3 id={"gamebody7-" + element.id} className="nomargin text-right game-item-price"><small id={"gamebody8-" + element.id} >Cena:</small><span id={"gamebody9-" + element.id}>{global_this.toFixed(element.price,2) + " zł"}</span></h3></div></div>)
          global_this.setState({rows: temp})
    });
      })
      for(var i=0;i<this.state.categories.length;i++) {
        var temp = global_this.state.categories_rows
        temp.push(<input type="button" className="list-group-item" id={this.state.categories[i].name + "-category"} onClick={this.handleCategoryChange} value={this.state.categories[i].name}></input>)
        global_this.setState({categories_rows: temp})
      }
      
    },
    handleRedirect: function(event) {
      $(function(){
        var splitted = event.target.id.split("-");
        var num = parseInt(splitted[1]);
        location.href='/games/' + num;
      });
    },
  handleSearchButton: function(event) {
      var global_this = this
      var category_name = event.target.text
      this.setState({rows: []})
      var search_value = $("#search-input").val();
      var json_getter = $.getJSON( "search.json?name=" + search_value, function( data ) {
        $.each(data, function(index, element) {
          var temp = global_this.state.rows
          temp.push(<div onClick={global_this.handleRedirect} id={"game-" + element.id} className="panel panel-default game-item"><div id={"gamebody1-" + element.id} className="panel-body"><h2 id={"gamebody2-" + element.id} className="nomargin"><span id={"gamebody3-" + element.id} className="game-item-link">{element.name}</span></h2><p id={"gamebody4-" + element.id}>Kategoria: <i><span id={"gamebody5-" + element.id} className="game-item-category" href="#">{element.category}</span></i></p><p><span id={"gamebody6-" + element.id} className="game-item-desc">{element.description}</span></p><h3 id={"gamebody7-" + element.id} className="nomargin text-right game-item-price"><small id={"gamebody8-" + element.id} >Cena:</small><span id={"gamebody9-" + element.id}>{global_this.toFixed(element.price,2) + " zł"}</span></h3></div></div>)
          global_this.setState({rows: temp})
    });
      })
    },
    
    handleCategoryChange: function(event) {
      var global_this = this
      var category_name = event.target.value
      this.setState({rows: []})
      var search_value = $("#search-input").val();
      var json_getter = $.getJSON( "search.json?name=" + search_value +"&category=" + category_name, function( data ) {
        $.each(data, function(index, element) {
          var temp = global_this.state.rows
          temp.push(<div onClick={global_this.handleRedirect} id={"game-" + element.id} className="panel panel-default game-item"><div id={"gamebody1-" + element.id} className="panel-body"><h2 id={"gamebody2-" + element.id} className="nomargin"><span id={"gamebody3-" + element.id} className="game-item-link">{element.name}</span></h2><p id={"gamebody4-" + element.id}>Kategoria: <i><span id={"gamebody5-" + element.id} className="game-item-category" href="#">{element.category}</span></i></p><p><span id={"gamebody6-" + element.id} className="game-item-desc">{element.description}</span></p><h3 id={"gamebody7-" + element.id} className="nomargin text-right game-item-price"><small id={"gamebody8-" + element.id} >Cena:</small><span id={"gamebody9-" + element.id}>{global_this.toFixed(element.price,2) + " zł"}</span></h3></div></div>)
          global_this.setState({rows: temp})
    });
      })
    },
    
    toFixed: function (value, precision) {
    var precision = precision || 0,
        power = Math.pow(10, precision),
        absValue = Math.abs(Math.round(value * power)),
        result = (value < 0 ? '-' : '') + String(Math.floor(absValue / power));

    if (precision > 0) {
        var fraction = String(absValue % power),
            padding = new Array(Math.max(precision - fraction.length, 0) + 1).join('0');
        result += '.' + padding + fraction;
    }
    return result;
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
            {this.state.categories_rows}
          </div>
        </div>
        <div className="col-md-8">
          <div className="input-group" role="search">
            <input id="search-input" type="text" className="form-control" placeholder="Search"></input>
            <span className="input-group-btn">
              <button onClick={this.handleSearchButton} id="search-btn" type="button" className="btn btn-default">
                <span className="glyphicon glyphicon-search"></span> Search
              </button>
            </span>
          </div>
          <div className="game-item-list">
          {this.state.rows}
          </div>
        </div>
          </div>
          
          
    }
});