module DocumentsHelper
  def select_zerocount?
    result = true
    @document.document_items.all.each do |item|
       if item.document_selects.all.count == 0
          next
       elsif item.document_selects.all.count >0
          result = false
          break
       end 
    end    
      return result
  end
  
end
