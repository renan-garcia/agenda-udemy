module ApplicationHelper
  ESTADOS_BRASILEIROS = [
    %w(Acre AC),
    %w(Alagoas AL),
    %W(Amap\u00E1 AP),
    %w(Amazonas AM),
    %w(Bahia BA),
    %W(Cear\u00E1 CE),
    ['Distrito Federal', 'DF'],
    ['Espírito Santo', 'ES'],
    %W(Goi\u00E1s GO),
    %W(Maranh\u00E3o MA),
    ['Mato Grosso', 'MT'],
    ['Mato Grosso do Sul', 'MS'],
    ['Minas Gerais', 'MG'],
    %W(Par\u00E1 PA),
    %W(Para\u00EDba PB),
    %W(Paran\u00E1 PR),
    %w(Pernambuco PE),
    %W(Piau\u00ED PI),
    ['Rio de Janeiro', 'RJ'],
    ['Rio Grande do Norte', 'RN'],
    ['Rio Grande do Sul', 'RS'],
    %W(Rond\u00F4nia RO),
    %w(Roraima RR),
    ['Santa Catarina', 'SC'],
    ['São Paulo', 'SP'],
    %w(Sergipe SE),
    %w(Tocantins TO)
  ].freeze

  def options_for_states(seleted)
    options_for_select(ESTADOS_BRASILEIROS, seleted)
  end

  def error_tag(model, attribute)
    if model.errors.key? attribute
      content_tag(:div,
                  model.errors[attribute].first,
                  class: 'error_message')
    end
  end

  def show_notice(notice)
    render partial: './layouts/notice', locals: { notice: notice } unless notice.nil?
  end
end
