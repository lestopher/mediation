class SettlementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @namedPlaintiff = Plaintiff.where("plaintiff_id = ?", current_user.id)
    @namedDefendant = Defendant.where("defendant_id = ?", current_user.id)
  end

  def new
    @plaintiff  = Plaintiff.new
    @defendant  = Defendant.new
    @settlement = Settlement.new
  end

  def create
    user_type = params[:user_type]
    other_party_type = params[:other_party_type]

    if user_type == 'plaintiff'
      user = Plaintiff.new :plaintiff_id => current_user.id
      other_party = Defendant.new :defendant_id => nil
    else
      user = Defendant.new :defendant_id => current_user.id
      other_party = Plaintiff.new :plaintiff_id => nil
    end

    user_max_settlement_amt = params[:amount]

    @settlement = Settlement.new do |s|
      s.plaintiff_id = user.class == Plaintiff ? user.id : other_party.id
      s.defendant_id = user.class == Defendant ? user.id : other_party.id
    end

    if settlement.save
      redirect_to @settlement, :notice => "Successfully created letter."
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private


end
