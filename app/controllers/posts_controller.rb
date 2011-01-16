#encoding:utf-8
class PostsController < ApplicationController
  
  respond_to :html
  
  def index
    @posts = Post.paginate :page => params[:page]
    @title = "Новости"
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  
  def create
    @post = Post.new(params[:post])
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => "Запись успешна добавлена") }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @post = Post.find(params[:id])
    respond_to do |format| 
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => "Запись успешна обновлена") }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    respond_to do |format|
      format.html redirect_to(posts_url)
    end
  end
  
end
