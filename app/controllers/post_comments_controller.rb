class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
      #変数post_image = PostImageモデル.引数で指定したデータを1件取得(データベースのデータ[post_imageテーブル?のid])
        #PostImageモデルのpost_imageのデータをidにより1件取得し、post_imageに代入する。
    comment = current_user.post_comments.new(post_comment_params)
      #変数comment = ログイン中のユーザー.post_commentsテーブルに?.投稿メソッド(post_commentテーブルのデータ)
      #以下の省略した記述
        #comment = PostComment.new(post_comment_params)
        #comment.user_id = current_user.id
          #変数comment = PostCommentモデル.投稿メソッド(post_commentテーブルのデータ)
          #user_idに付随するcomment = ログイン中のユーザーのid
    comment.post_image_id = post_image.id
      #変数comment.post_image_id = post_imageテーブルのid
        #post_imageのidをpost_image_idに付随するcommentに付与する。
    comment.save
      #comment変数.保存メソッド
        #comment変数を保存する。
    redirect_to post_image_path(post_image)
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
