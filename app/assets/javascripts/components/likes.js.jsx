var LikeField = React.createClass({
  shown: false,
  getInitialState: function (){
    return { data: [] };
  },
  loadLikesListFromServer: function(callback) {
    $.ajax({
        url: this.props.url,
        data: 'json',
        success: function(result) {
            this.setState( {data: result} );
            callback();
        }.bind(this),
        error: function(xhr, status, err) {
            console.error(this.props.url, status, err.toString());
        }.bind(this)
    });
  },
  render: function() {
    var Button = ReactBootstrap.Button
    var OverlayTrigger = ReactBootstrap.OverlayTrigger
    var Popover = ReactBootstrap.Popover
    return (
      <OverlayTrigger ref='likePopover' trigger="manual" placement="right" overlay={
          <Popover title="いいねした人">
            <LikeList data={this.state.data}></LikeList>
        </Popover>
      }>
          <Button onClick={this.handleClick} bsStyle="default">見る</Button>
      </OverlayTrigger>
    );
  },

  handleClick: function() {
    if(this.shown) {
        this.refs.likePopover.hide();
        this.shown = false;
    }else {
        this.loadLikesListFromServer(function(){
            this.refs.likePopover.show();
            this.shown = true; 
        }.bind(this));
    }
  },
});

var LikeList = React.createClass({
  render: function(){
    var ListGroup = ReactBootstrap.ListGroup
    var likeNodes = this.props.data.map(function (like) {
        return (
            <Like name = {like}></Like>
        );
    });
    return (
        <ListGroup>
            {likeNodes}
        </ListGroup>
    );
  }
});

var Like = React.createClass({
    render: function(){
      var ListGroupItem = ReactBootstrap.ListGroupItem
      return (
          <ListGroupItem>
            {this.props.name}
          </ListGroupItem>
      );
    }
});
