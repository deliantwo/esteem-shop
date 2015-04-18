var ManageCart = React.createClass({
    getInitialState: function() {
      return {
        current_steam_ppg: this.props.current_steam_ppg,
        current_origin_ppg: this.props.current_origin_ppg,
        steam_price: this.props.steam_price,
        origin_price: this.props.origin_price,
        steamAction: "Nie załadowano danych",
        originAction: "Nie załadowano danych",
        shopping_cart_id: this.props.shopping_cart_id
      };
    },
    componentDidMount: function (event) {
      var global_this = this
      var json_getter = $.getJSON( "../cart_status.json?ppg=" + this.state.current_steam_ppg.id + "&shopping_cart_id=" + this.state.shopping_cart_id, function( data ) {
          $.each(data, function(index, element) {
            if(element == "in_cart") {
              global_this.setState({steamAction: "Usuń z koszyka"})
            }
            else if(element == "not_in_cart") {
              global_this.setState({steamAction: "Dodaj do koszyka"})
            }
    });
      })
      var json_getter = $.getJSON( "../cart_status.json?ppg=" + this.state.current_origin_ppg.id + "&shopping_cart_id=" + this.state.shopping_cart_id, function( data ) {
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
      var action = event.target.id
      var global_this = this
      if(action == "steam-cart") {
        var json_getter = $.getJSON( "../update_cart.json?ppg=" + this.state.current_steam_ppg.id + "&shopping_cart_id=" + this.state.shopping_cart_id, function( data ) {
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
        var json_getter = $.getJSON( "../update_cart.json?ppg=" + this.state.current_origin_ppg.id + "&shopping_cart_id=" + this.state.shopping_cart_id, function( data ) {
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
    render: function() {
        return <div>
        <table class="table table-bordered">
            <tr>
                <td><img src="<%= asset_path 'steam_20x20.png' %>" alt="steam"></img></td>
                <td>{this.state.steam_price} PLN</td>
                <td><a id="steam-cart" onClick={this.updateCart}>{this.state.steamAction}</a></td>
            </tr>
            <tr>
                <td><img src="<%= asset_path 'origin_20x20.png' %>" alt="steam"></img></td>
                <td>{this.state.origin_price} PLN</td>
                <td><a id="origin-cart" onClick={this.updateCart}>{this.state.originAction}</a></td>
            </tr>
        </table>
          </div>
          
          
    }
});