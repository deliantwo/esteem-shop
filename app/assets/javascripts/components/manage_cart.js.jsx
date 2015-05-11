var ManageCart = React.createClass({
    getInitialState: function() {
      return {
        current_steam_ppg: this.props.current_steam_ppg,
        current_origin_ppg: this.props.current_origin_ppg,
        steam_price: this.props.steam_price,
        origin_price: this.props.origin_price,
        steamAction: "Brak danych",
        originAction: "Brak danych",
        shopping_cart_id: this.props.shopping_cart_id,
        steam_img_url: this.props.steam_img_url,
        origin_img_url: this.props.origin_img_url,
        shopping_cart_token: this.props.shopping_cart_token
      };
    },
    componentDidMount: function (event) {
      var global_this = this
      var json_getter = $.getJSON( "../cart_status.json?ppg=" + this.state.current_steam_ppg.id + "&shopping_cart_id=" + this.state.shopping_cart_id + "&shopping_cart_token=" + global_this.state.shopping_cart_token, function( data ) {
          $.each(data, function(index, element) {
            if(element == "in_cart") {
              global_this.setState({steamAction: "Usuń z koszyka"})
            }
            else if(element == "not_in_cart") {
              global_this.setState({steamAction: "Dodaj do koszyka"})
            }
    });
      })
      var json_getter = $.getJSON( "../cart_status.json?ppg=" + this.state.current_origin_ppg.id + "&shopping_cart_id=" + this.state.shopping_cart_id + "&shopping_cart_token=" + global_this.state.shopping_cart_token, function( data ) {
          $.each(data, function(index, element) {
            if(element == "in_cart") {
              global_this.setState({originAction: "Usuń z koszyka"})
            }
            else if(element == "not_in_cart") {
              global_this.setState({originAction: "Dodaj do koszyka"})
            }
    });
      })
    },
    updateCart: function(event) {
      PubSub.publish('updateCartButton:onClick')
      var action = event.target.id
      var global_this = this
      if(action == "steam-cart") {
        var json_getter = $.getJSON( "../update_cart.json?ppg=" + this.state.current_steam_ppg.id + "&shopping_cart_id=" + this.state.shopping_cart_id + "&shopping_cart_token=" + global_this.state.shopping_cart_token, function( data ) {
          $.each(data, function(index, element) {
            if(element == "added") {
              global_this.setState({steamAction: "Usuń z koszyka"})
            }
            else if(element == "removed") {
              global_this.setState({steamAction: "Dodaj do koszyka"})
            }
    });
      })
      }
      else if(action == "origin-cart") {
        var json_getter = $.getJSON( "../update_cart.json?ppg=" + this.state.current_origin_ppg.id + "&shopping_cart_id=" + this.state.shopping_cart_id + "&shopping_cart_token=" + global_this.state.shopping_cart_token, function( data ) {
          $.each(data, function(index, element) {
            if(element == "added") {
              global_this.setState({originAction: "Usuń z koszyka"})
            }
            else if(element == "removed") {
              global_this.setState({originAction: "Dodaj do koszyka"})
            }
    });
      })
      }
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
    render: function() {
        return <div className="panel panel-default text-center no-margin">
        <table className="table table-bordered">
            <tr>
                <td><img src={this.state.steam_img_url} alt="steam"></img></td>
                <td>{this.toFixed(this.state.steam_price,2)} PLN</td>
                <td><a id="steam-cart" onClick={this.updateCart}>{this.state.steamAction}</a></td>
            </tr>
            <tr>
                <td><img src={this.state.origin_img_url} alt="origin"></img></td>
                <td>{this.toFixed(this.state.origin_price,2)} PLN</td>
                <td><a id="origin-cart" onClick={this.updateCart}>{this.state.originAction}</a></td>
            </tr>
        </table>
        </div>
          
          
    }
});