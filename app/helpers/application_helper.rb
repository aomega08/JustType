module ApplicationHelper
  def read_css_asset(name)
    content = if Rails.application.assets && Rails.application.assets[name]
                Rails.application.assets[name].to_s
              else
                File.read "#{Rails.root}/public#{stylesheet_path(name, host: nil)}"
              end

    content.gsub(/\n\s*/, '').gsub(/\/\*[^*]*\*+([^\/*][^*]*\*+)*\//, '')
  end

  def website_jsonld
    {
      '@context': 'http://schema.org',
      '@type': 'WebSite',
      '@id': '#website',
      url: root_url,
      name: Settings.site_name
    }.to_json
  end

  def organization_jsonld
    {
      '@context': 'http://schema.org',
      '@type': 'Organization',
      '@id': '#organization',
      name: Settings.site_name,
      logo: '',
      url: root_url
    }.to_json
  end
end
