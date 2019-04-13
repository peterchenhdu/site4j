<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
    <url>
        <loc>${config.siteUrl}</loc>
        <priority>1.0</priority>
        <lastmod>${.now?string("yyyy-MM-dd")}</lastmod>
        <changefreq>daily</changefreq>
    </url>
    <url>
        <loc>${config.siteUrl}/guestbook</loc>
        <priority>0.6</priority>
        <lastmod>${.now?string("yyyy-MM-dd")}</lastmod>
        <changefreq>daily</changefreq>
    </url>
    <url>
        <loc>${config.siteUrl}/updateLog</loc>
        <priority>0.6</priority>
        <lastmod>${.now?string("yyyy-MM-dd")}</lastmod>
        <changefreq>daily</changefreq>
    </url>
    <url>
        <loc>${config.siteUrl}/recommended</loc>
        <priority>0.6</priority>
        <lastmod>${.now?string("yyyy-MM-dd")}</lastmod>
        <changefreq>daily</changefreq>
    </url>
    <#list articleList as item>
    <url>
        <loc>${config.siteUrl}/article/${item.id}</loc>
        <priority>0.6</priority>
        <lastmod>${item.updateTime?string("yyyy-MM-dd")}</lastmod>
        <changefreq>daily</changefreq>
    </url>
    </#list>
    <#list articleTypeList as item>
    <url>
        <loc>${config.siteUrl}/type/${item.id}</loc>
        <priority>0.6</priority>
        <lastmod>${item.updateTime?string("yyyy-MM-dd")}</lastmod>
        <changefreq>daily</changefreq>
    </url>
    </#list>

<#list articleTagsList as item>
    <url>
        <loc>${config.siteUrl}/tag/${item.id}</loc>
        <priority>0.6</priority>
        <lastmod>${item.updateTime?string("yyyy-MM-dd")}</lastmod>
        <changefreq>daily</changefreq>
    </url>
</#list>
</urlset>