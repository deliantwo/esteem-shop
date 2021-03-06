var UpdateCartWidget = React.createClass({
    getInitialState: function() {
      return {
        rows: [],
        shopping_cart_id: this.props.shopping_cart_id,
        is_empty: 0,
        shopping_cart_token: this.props.shopping_cart_token
      };
    },
    componentDidMount: function (event) {
      this._subscribeToEvents()
      this.updateCart()
    },
    componentWillUnmount: function (event) {
      this._unsubscribeFromEvents()
    },
    _subscribeToEvents: function() {
      var global_this = this
      PubSub.subscribe("updateCartButton:onClick", function() {
        global_this.updateCart()  
      })
    },
    updateCart: function () {
      this.setState({rows: []})
      var global_this = this
      $.getJSON( "../cart_content.json?shopping_cart_id=" + global_this.state.shopping_cart_id + "&shopping_cart_token=" + global_this.state.shopping_cart_token, function( data ) {
          $.each(data, function(index, element) {
            if(index == "status" & element == "empty") {
              var temp = global_this.state.rows
              temp.push(<li><a href="#"> Koszyk jest pusty </a></li>)
              global_this.setState({rows: temp})
            }
            else {
            var temp = global_this.state.rows
            temp.push(<li><a href={Routes.game_path(index)}> {element} </a></li>)
            global_this.setState({rows: temp})
            }
    });
      })
    },
    _unsubscribeFromEvents: function() {
      PubSub.unsubscribe("updateCartButton:onClick")  
    },
    render: function() {
        return <ul className="nav navbar-nav navbar-right">
            <li className="dropdown">
              <a href="#" className="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Koszyk<span className="caret"></span></a>
              <ul className="dropdown-menu" role="menu">
        {this.state.rows}
        <li role="presentation" className="divider"></li>
        <li><a href={Routes.cart_detail_view_path()}> Kup </a></li>
        </ul>
            </li>
          </ul>
    }
});