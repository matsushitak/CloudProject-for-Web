class ProjectController < ApplicationController

  # 一覧画面表示時
  def index
    @projects = Project.all
  end

  # 新規作成画面表示時
  def new
    @project = Project.new
  end

  # 新規作成時
  def new_action
    # TODO: 画像をアップロード
    # TODO: 画像のバリデーション
    # TODO: 日付のバリデーション
    @title = params[:title]
    @image = params[:image]
    @overview = params[:overview]
    @category = params[:category]
    @recruitment_date_start = params[:recruitment_date_start]
    @recruitment_date_finish = params[:recruitment_date_finish]
    @people_count_goal = params[:people_count_goal]
    @text = params[:text]
    @project = Project.new(
        user_id: @current_user.id,
        title: @title,
        image_name: "default.png",
        overview: @overview,
        category: @category,
        recruitment_date_start: @recruitment_date_start,
        recruitment_date_finish: @recruitment_date_finish,
        people_count_goal: @people_count_goal.to_i,
        text: @text
    )
    if @project.save
      flash[:notice] = "プロジェクトを作成しました"
      redirect_to("/")
    else
      @error_message = "プロジェクトを作成できません"
      render("project/new")
    end
  end

  # 詳細画面表示時
  def show
    @project = Project.find(params[:id])
  end

end
