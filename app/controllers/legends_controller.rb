class LegendsController < ApplicationController
  def index
    @bokes_all = Boke.all
    @sum_1 = {}
    @bokes_all.each do |boke|
      @sum = 0
      stars = Star.where(boke_id:boke.id)
        stars.each do |star|
          @sum += star.status
        end
      @sum_1[boke.id] = @sum
    end
    boke_hash = Hash[ @sum_1.sort_by{ |_, v| -v } ]
    array = boke_hash.keys

    @bokes = Boke.where(id:array).order(['field(id,?)',array]).page(params[:page]).per(4)
  end

  def baka
    @bokes_all = Boke.all
    @sum_1 = {}
    @bokes_all.each do |boke|
      @sum = 0
      stars = Star.where(boke_id:boke.id)
        stars.each do |star|
          @sum += star.status
        end
      @sum_1[boke.id] = @sum
    end
    boke_hash = Hash[ @sum_1.sort_by{ |_, v| -v } ]
    array = boke_hash.keys

    @bokes = Boke.where(id:array,category_id:8).order(['field(id,?)',array]).page(params[:page]).per(4)
  end
  def surreal
    @bokes_all = Boke.all
    @sum_1 = {}
    @bokes_all.each do |boke|
      @sum = 0
      stars = Star.where(boke_id:boke.id)
        stars.each do |star|
          @sum += star.status
        end
      @sum_1[boke.id] = @sum
    end
    boke_hash = Hash[ @sum_1.sort_by{ |_, v| -v } ]
    array = boke_hash.keys

    @bokes = Boke.where(id:array,category_id:9).order(['field(id,?)',array]).page(params[:page]).per(4)
  end
  def ogeretu
    @bokes_all = Boke.all
    @sum_1 = {}
    @bokes_all.each do |boke|
      @sum = 0
      stars = Star.where(boke_id:boke.id)
        stars.each do |star|
          @sum += star.status
        end
      @sum_1[boke.id] = @sum
    end
    boke_hash = Hash[ @sum_1.sort_by{ |_, v| -v } ]
    array = boke_hash.keys

    @bokes = Boke.where(id:array,category_id:10).order(['field(id,?)',array]).page(params[:page]).per(4)
  end
  def black
    @bokes_all = Boke.all
    @sum_1 = {}
    @bokes_all.each do |boke|
      @sum = 0
      stars = Star.where(boke_id:boke.id)
        stars.each do |star|
          @sum += star.status
        end
      @sum_1[boke.id] = @sum
    end
    boke_hash = Hash[ @sum_1.sort_by{ |_, v| -v } ]
    array = boke_hash.keys

    @bokes = Boke.where(id:array,category_id:11).order(['field(id,?)',array]).page(params[:page]).per(4)
  end
  def relative
    @bokes_all = Boke.all
    @sum_1 = {}
    @bokes_all.each do |boke|
      @sum = 0
      stars = Star.where(boke_id:boke.id)
        stars.each do |star|
          @sum += star.status
        end
      @sum_1[boke.id] = @sum
    end
    boke_hash = Hash[ @sum_1.sort_by{ |_, v| -v } ]
    array = boke_hash.keys

    @bokes = Boke.where(id:array,category_id:12).order(['field(id,?)',array]).page(params[:page]).per(4)
  end
  def example
    @bokes_all = Boke.all
    @sum_1 = {}
    @bokes_all.each do |boke|
      @sum = 0
      stars = Star.where(boke_id:boke.id)
        stars.each do |star|
          @sum += star.status
        end
      @sum_1[boke.id] = @sum
    end
    boke_hash = Hash[ @sum_1.sort_by{ |_, v| -v } ]
    array = boke_hash.keys

    @bokes = Boke.where(id:array,category_id:13).order(['field(id,?)',array]).page(params[:page]).per(4)
  end
  def other
    @bokes_all = Boke.all
    @sum_1 = {}
    @bokes_all.each do |boke|
      @sum = 0
      stars = Star.where(boke_id:boke.id)
        stars.each do |star|
          @sum += star.status
        end
      @sum_1[boke.id] = @sum
    end
    boke_hash = Hash[ @sum_1.sort_by{ |_, v| -v } ]
    array = boke_hash.keys

    @bokes = Boke.where(id:array,category_id:14).order(['field(id,?)',array]).page(params[:page]).per(4)
  end

end
