module EbayClassifieds
  module Models
    class Ad 
      attr_accessor(:price, :locations, :status, :id, :title, :address, :attributes, :description, :category, :pictures, :modification_date_time, :start_date_time)
      include AttributeInitializer
      include EbayClassifieds::ApiResource
      api_path '/ads'
      api_format :xml
            
      def attributes
        @attributes || []
      end
      def pictures
        @pictures || []
      end
      
      def self.search(params = {})
        resp = api_get(api_path_join(params))
        data = resp.parsed_response['ads']
        raise "Unknown Data structure!: #{resp}" unless data
        EbayClassifieds::PaginatedCollection.new(
          (data['ad'] ? data['ad'].collect{ |ad| new_from_api_data(ad) } : []),
          :page => params[:page] || 1,
          :per => params[:size] || 50,
          :total => (data['paging']['numFound'].to_i rescue 0)
        )
      end
      def self.find(id)
        resp = api_get(api_path_join("/#{id}"))
        raise "Unknown Data structure!: #{resp}" unless resp && resp['ad']
        resp.has_key?('ad') ? new_from_api_data(resp['ad']) : nil
      rescue Exceptions::HttpError => e
        raise e unless e.response.code == 404
        nil
      end
      def self.new_from_api_data(data)
        
          inst = new(:id => data['id'],
                      :title => data['title'],
                      :description => data['description'],
                      :status => data['ad-status'],
                      :category => Category.new_from_api_data(data['category']),
                      :start_date_time => (Time.parse(data['start_date_time']) rescue nil),
                      :modification_date_time => (Time.parse(data['modification_date_time']) rescue nil),
                      :address => AdAddress.new_from_api_data(data['ad_address']))
                      
          if data['price'] && data['price']['amount']
            inst.price = data['price']['amount'].to_f
          end
          if data['attributes'] && data['attributes']['attribute']
            inst.attributes = [data['attributes']['attribute']].flatten.inject({}) do |hash,attr|
              hash[attr['name']] = {:name => attr['localized_label'], :value => attr['value']}
              hash
            end
          end
          if data['pictures'] && data['pictures']['picture']
            pic_data = data['pictures']['picture']
            inst.pictures = [pic_data].flatten.collect{|p|
              Picture.new_from_api_data(p)
             }.compact
          end
          inst
      end
    end
  end
end