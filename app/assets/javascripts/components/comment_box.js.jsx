var CommentBox = React.createClass({
  loadCommentsFromServer: function() {
    $.ajax({
      url: this.props.url,
      data: 'json',
      success: function (result) {
        this.setState( {data: result} );
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    }); 
  },
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.loadCommentsFromServer();
  },
  render: function() {
    return ( 
      <div className="commentBox">
        <CommentList data={this.state.data} />
      </div>
    );
  }
});

var CommentList = React.createClass({
    render: function() {
        var commentNodes = this.props.data.map(function (comment) {
            return (
                <Comment author = {comment.author}>
                  {comment.text}
                </Comment>
            );
        });
        return (
            <div className="commentList">
              {commentNodes}
            </div>
        );
    }
});

var CommentForm = React.createClass({
    render: function() {
        return (
            <div className="commentForm">
              Hello, world! I am a CommentForm.
            </div>
        );
    }
});

var Comment = React.createClass({
    render: function() {
        var rawMarkup = marked(this.props.children.toString(), {sanitize: true});
        var ListGroupItem = ReactBootstrap.ListGroupItem
        return (
            <div className="comment">
                 <ListGroupItem>
                     <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
                     {this.props.author}
                     <a href="">いいね</a>
                 </ListGroupItem>
            </div>
        );
    }
});
