$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.15/ToBeScraped.html
$scraped_page.Links