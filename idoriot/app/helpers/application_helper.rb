module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when 'notice' then 'alert-success'
    when 'alert'  then 'alert-warning'
    when 'error'  then 'alert-danger'
    else flash_type.to_s
    end
  end
end
