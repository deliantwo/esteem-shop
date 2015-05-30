var DisableCheckoutButton = React.createClass({
    getInitialState: function() {
      return {
        payment_test_path: this.props.payment_test_path,
        flag: true
      };
    },
    
    disableBtn: function (event) {
        if(this.state.flag) {
            this.setState({flag: false})
        }
        else {
            event.preventDefault()
        }
    },
    render: function() {
        return <a onClick={this.disableBtn} id="btn_confirm" className="btn btn-primary" href={this.state.payment_test_path}>Potwierdź</a>
    }
});