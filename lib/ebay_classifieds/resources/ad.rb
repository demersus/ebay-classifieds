module EbayClassifieds
  module Resources
    class Ad < 
      Struct.new(:price, :locations, :status, :id, :title, :address, :attributes, :description, :category, :pictures, :modification_date_time, :start_date_time)
      include EbayClassifieds::Resource
      api_endpoint '/ads.xml'
      
      def attributes
        @attributes || []
      end
      def pictures
        @pictures || []
      end
      
      def self.search(params = {})
        resp = call_api(:get,params)
        data = resp.parsed_response['ads']
        #debugger
        EbayClassifieds::PaginatedCollection.new(
          data['ad'].collect do |ad| 
            new_from_api_data(ad)
          end,
          :page => params[:page] || 1,
          :per => params[:size] || 50,
          :total => (data['paging']['numFound'] rescue 0)
        )
      end
      def self.new_from_api_data(data)
        inst = new(:id => data['id'],
                    :title => data['title'],
                    :description => data['description'],
                    :status => data['ad-status'],
                    :category => Category.new_from_api_data(data['category']),
                    :start_date_time => Time.new(data['start_date_time']),
                    :modification_date_time => Time.new(data['modification_date_time']),
                    :address => AdAddress.new_from_api_data(data['ad-address']))
                    
        if data['price'] && data['price']['amount']
          inst.price = data['price']['amount'].to_f
        end
        if data['attributes'] && data['attributes']['attribute']
          #inst.attributes = AdAttributes.new_from_api_data(data['attributes']['attribute'])
        end
        if data['pictures'] && data['pictures']['picture']
          pic_data = data['pictures']['picture']
          if pic_data.is_a? Array
            inst.pictures = pic_data.collect{|p| Picture.new_from_api_data(p)}
          else
            inst.pictures = [Picture.new_from_api_data(pic_data)]
          end
        end
        inst
      end
    end
  end
end