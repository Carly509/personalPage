class PostsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
  # before_action :authorize, :except => :new
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Articles", :posts_path

 
  def search
    if params[:title]
      @posts = Post.search(params[:content])
    else
      @posts = Post.all
    end
  end

  def home
    if params[:category].blank?
      @posts = Post.where("created_at >= ?", 1.week.ago.utc).order("created_at DESC").limit(9)
      else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id).order("created_at DESC").limit(9)
      end
  end

  # GET /posts
  # GET /posts.json
  def index
    if params[:category].blank?
      @posts = Post.paginate(:page => params[:page], :per_page => 18)
      else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id).paginate(:page => params[:page], :per_page => 18)
      end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    add_breadcrumb @post.increment, post_path(@post)
  end


  # GET /posts/new
  def new
    if current_user.try(:admin?) 
    @post = Post.new
  else
    redirect_to root_path
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
		if @post.save
			flash.now[:success] = "Successfully created post!"
			redirect_to post_path(@post)
		else
			flash.now[:alert] = "Error creating new post!"
			render :new
		end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
   if @post.destroy
    flash.now[:success] = "Post deleted!"
    redirect_to root_path
   else
    flash.now[:alert] = "Error creating new post!"
    redirect_to post_path(@post)
    end
  end
  
  def contact
    add_breadcrumb "Contact", about_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id]) #.friendly
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  
    def post_params
      params.require(:post).permit(:title, :content, :picture, :category_id )
  end

  # def set_categories
  #   @categories = Category.all.map{ |c| [c.name, c.id] }
  # end

end
