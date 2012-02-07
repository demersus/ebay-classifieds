module EbayClassifieds
  module Models
    class Category
      attr_accessor(:id,:name,:sub_categories)
      include AttributeInitializer
      include EbayClassifieds::ApiResource
      api_path '/categories'
      api_format :xml
      
      def initialize(data)
        @sub_categories = []
        super(data)
      end
      def self.new_from_api_data(data)
        inst = new(:id => data['id'],:name => data['localized_name'])
        # recursive sub categories
        [data['category']].flatten.compact.each do |cat|
          inst.sub_categories << new_from_api_data(cat)
        end
        inst
      end
      def self.all
        resp = api.get(api_path_join)
        new_from_api_data(resp['categories']['category'])
      end
      def self.find(id)
        resp = api.get(api_path_join("/#{id}"))
        new_from_api_data(resp['category'])
      end     
    end
  end
end