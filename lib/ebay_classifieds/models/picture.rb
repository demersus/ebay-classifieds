module EbayClassifieds
  module Models
    class Picture < Struct.new(:thumbnail,:teaser,:normal,:large,:extra_large)
      def self.new_from_api_data(data) 
        #begin
          link = data['link']
          if link
            new(
              :thumbnail => (link.select{|h| h['rel'] == 'thumbnail'}.first || {})['href'],
              :teaser => (link.select{|h| h['@rel'] == 'teaser'}.first ||{})['href'],
              :normail => (link.select{|h| h['rel'] == 'normal'}.first || {})['href'],
              :large => (link.select{|h| h['rel'] == 'large'}.first || {})['href'],
              :extra_large => (link.select{|h| h['rel'] == 'extra-large'}.first || {})['href']
            )
          else 
            nil
          end
        #rescue
        #  debugger
        #end
      end      
    end
  end
end

  # [
    # {"link"=>[
      # {"@rel"=>"thumbnail", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/666r1/04999e9_24.jpeg"}, 
      # {"@rel"=>"teaser", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/666r1/04999e9_25.jpeg"}, 
      # {"@rel"=>"normal", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/666r1/04999e9_26.jpeg"}, 
      # {"@rel"=>"large", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/666r1/04999e9_27.jpeg"}, 
      # {"@rel"=>"extra-large", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/666r1/04999e9_20.jpeg"}]
    # }, 
    # {"link"=>[
      # {"@rel"=>"thumbnail", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/666r1/8022j40_24.jpeg"}, 
      # {"@rel"=>"teaser", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/666r1/8022j40_25.jpeg"}, 
      # {"@rel"=>"normal", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/666r1/8022j40_26.jpeg"}, 
      # {"@rel"=>"large", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/666r1/8022j40_27.jpeg"}, 
      # {"@rel"=>"extra-large", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/666r1/8022j40_20.jpeg"}]
    # }, 
    # {"link"=>[
      # {"@rel"=>"thumbnail", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/667r1/2169e8m_24.jpeg"}, 
      # {"@rel"=>"teaser", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/667r1/2169e8m_25.jpeg"}, 
      # {"@rel"=>"normal", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/667r1/2169e8m_26.jpeg"}, 
      # {"@rel"=>"large", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/667r1/2169e8m_27.jpeg"}, 
      # {"@rel"=>"extra-large", "@href"=>"http://imgc.classistatic.com/cps/poc/120130/667r1/2169e8m_20.jpeg"}
      # ]
    # }
  # ]