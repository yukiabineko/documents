module UsersHelper
#教員提出保護者から何件提出されたか？
  def reply_count(memo,randam)
    documents = Document.where(memo: memo, randam: randam) #条件の提出抽出
    count = 0                                              #保護者の提出数

    documents.each do |document|
      if document.answers.all.count > 0
        count += 1
      end    
    end    
    return count
  end      
end
