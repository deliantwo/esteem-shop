var DetailViewTable = React.createClass({
    getInitialState: function() {
      return {
        rows: [],
        shopping_cart_id: this.props.shopping_cart_id,
        is_empty: 0,
        shopping_cart_token: this.props.shopping_cart_token,
        total: 0
      };
    },
    
    componentDidMount: function (event) {
        this.updateCart()
        console.log(Routes.cart_detail_view_path())
        console.log(Routes.cart_checkout_path())
    },
    
    updateCart: function () {
      this.setState({rows: []})
      var global_this = this
      this.getTotal()
      $.getJSON( "../detail_cart_content.json?shopping_cart_id=" + global_this.state.shopping_cart_id + "&shopping_cart_token=" + global_this.state.shopping_cart_token, function( data ) {
          $.each(data, function(index, element) {
            var temp = global_this.state.rows
            temp.push(<tr>
            <td>{index}</td>
            <td><a href={"/games/" + element.id}>{element.name}</a></td>
            <td>{element.platform.name}</td>
            <td>{global_this.toFixed(element.price,2) + " zł"}</td>
            <td><input type="number" name={"quantityInput_" + (index - 1)} min="0" max="99" value={element.quantity} onChange={global_this.handleQuantityChange}></input></td>
            <td>{global_this.toFixed(element.price * element.quantity,2) + " zł"}</td>
            <td><a onClick={global_this.handleRemove} name={"removeBtn_" + (index - 1)} type="button" className="close" href="#" ><span aria-hidden="true">&times;</span></a></td></tr>)
           global_this.setState({rows: temp})
    });
      })
    },
    
    handleQuantityChange: function (event) {
        var splitted = event.target.name.split("_")
        var num = parseInt(splitted[1])
        var global_this = this
      $.getJSON( "../change_quantity.json?shopping_cart_id=" + global_this.state.shopping_cart_id + "&shopping_cart_token=" + global_this.state.shopping_cart_token + "&item_id=" + num + "&quantity=" + event.target.value, function( data ) {
          $.each(data, function(index, element) {
              if(element == "success") {
                  global_this.updateCart()
              }
              else{
                  return
              }
          })
      })
    },
    
    handleRemove: function (event) {
        var splitted = event.currentTarget.name.split("_")
        var num = parseInt(splitted[1])
        var global_this = this
      $.getJSON( "../change_quantity.json?shopping_cart_id=" + global_this.state.shopping_cart_id + "&shopping_cart_token=" + global_this.state.shopping_cart_token + "&item_id=" + num + "&quantity=0", function( data ) {
          $.each(data, function(index, element) {
              if(element == "success") {
                  global_this.updateCart()
              }
          })
      })
    },
    
    getTotal: function (event) {
        var global_this = this
        $.getJSON( "../cart_total.json?shopping_cart_id=" + global_this.state.shopping_cart_id + "&shopping_cart_token=" + global_this.state.shopping_cart_token, function( data ) {
          $.each(data, function(index, element) {
              if(index == "total") {
                  global_this.setState({total: element})
              }
          })
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

    render: function() {
        return <div className="panel panel-default">
            <div className="panel-body">
                <p>Poniżej znajduje się zawartość Twojego koszyka. Kliknięcie w przycisk "przejdź dalej" spowoduje przejście na stronę podsumowania zamówienia, gdzie dokończysz transakcję.</p>
            </div>
            <table className="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nazwa gry</th>
                        <th>Platforma</th>
                        <th>Cena brutto</th>
                        <th>Liczba sztuk</th>
                        <th>Wartość brutto</th>
                        <th>Usuń produkt</th>
                    </tr>
                </thead>
                <tbody>
                    {this.state.rows}
                </tbody>
            </table>
            <div className="panel-body text-right">
                <h3>Razem: <strong>{this.toFixed(this.state.total,2)} zł</strong></h3>
                <a className="btn btn-primary" href={Routes.cart_checkout_path()}>Przejdź dalej</a>
            </div>
        </div>
    }
});