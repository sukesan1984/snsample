module API
  module V1
    class Posts < Grape::API
      resources :posts do
        resource ':post_id' do
          desc 'return post comment'
          params do
            requires :post_id, type: Integer, desc: 'post_id'
          end
          get :comments do
            post = Post.find(params[:post_id])
            comments = Comment.where('post_id = ?', post.id).preload(:user)
            return comments.map{ |comment| { author: "#{comment.user.last_name}#{comment.user.first_name}", text: "#{comment.comment}" } }
          end
        end
      end
    end
  end
end
