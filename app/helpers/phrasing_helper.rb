module PhrasingHelper
  
  def can_edit_phrases?
    admin?
  end
end
