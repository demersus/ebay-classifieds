module EbayClassifieds
  class PaginatedCollection
    include Enumerable
    attr_reader :collection, :per, :total, :page
    def initialize(collection = [], pagination = {} )
      @collection = collection
      @per = pagination['per'] || 1
      @page = pagination['page'] || 1
      @total = pagination['total'] || 0
    end
    def each(&block)
      @collection.each{|i| yield i}
    end
    def pages
      return 0 if total == 0
      return total.to_i / per.to_i
    end 
  end
end