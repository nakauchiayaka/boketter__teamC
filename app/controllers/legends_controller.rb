class LegendsController < ApplicationController
  def index
    @bokes_all = Boke.all
    # @sum_all = []
    @sum_1 = {}
    @bokes_all.each do |boke|
      @sum = 0
      stars = Star.where(boke_id:boke.id)
        stars.each do |star|
          @sum += star.status
        end
      @sum_1[boke.id] = @sum
      # @sum_all << @sum_1
    end
    boke_hash = Hash[ @sum_1.sort_by{ |_, v| -v } ]
    array = boke_hash.keys

    @bokes = Boke.where(id:array).order(['field(id,?)',array]).page(params[:page]).per(4)
  end
end
