module API
  module V1
    class PostLikes < Grape::API
      resource :posts do
        # Get /api/v1/posts/{:post_id}/post_likes/
        desc 'return all likes for post'
        params do
          requires :post_id, type: Integer, desc: 'post_id'
        end
        resource ':post_id' do
          get :post_likes do
            post = Post.find(params[:post_id])
            return post.likes.map { |like| "#{like.user.last_name}#{like.user.first_name}" }
          end
        end
      end
    end
  end
end
