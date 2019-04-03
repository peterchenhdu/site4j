/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.util.lucene;

import com.hankcs.lucene.HanLPIndexAnalyzer;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.document.Document;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;

import java.io.IOException;
import java.util.UUID;

/**
 * Created by chenpi5 on 2019/3/19.
 */
public class Main {
    public static void main(String[] args) throws IOException, ParseException, InvalidTokenOffsetsException {
        LuceneSupport luceneSupport = new LuceneSupport();
        luceneSupport.init();

//        System.out.println(luceneSupport.highlighter("content", "浙江省杭州市滨江区海康威视", "杭州"));


//        testHanLPIndexAnalyzer();

        query(luceneSupport);
//        add(luceneSupport);
    }


    //查询
    private static void query(LuceneSupport luceneSupport) throws IOException, ParseException {
        Pager<Document> docPage = luceneSupport.page(10, 1, "杭州", "title", "content");
        for (Document doc : docPage.getDataList()) {
            //搜索到ID后，取数据库查详情
            System.out.println(doc.getField("id").stringValue());
        }
    }

    //新增
    private static void add(LuceneSupport luceneSupport) throws IOException {
        Blog blog = new Blog();
        blog.setId(UUID.randomUUID().toString().replace("-",""));
        blog.setTitle("杭州科技公司 你好----");
        blog.setKeyWords("你好 杭州");
        blog.setContent("浙江省杭州市滨江区海康威视");
        luceneSupport.index(Blog.toDoc(blog));
        luceneSupport.commit();
    }

    //分词
    private static void testHanLPIndexAnalyzer() throws IOException {
        String chineseText = "浙江省杭州市滨江区海康威视，宇视科技";
        try (Analyzer smart = new HanLPIndexAnalyzer()) {
            TokenStream ts  = smart.tokenStream("content", chineseText);
            System.out.println("lucene-analyzers-smart cn中文分词器分词效果：");
            ts.reset();
            CharTermAttribute cta = ts.getAttribute(CharTermAttribute.class);
            while (ts.incrementToken()) {
                System.out.print(cta.toString() + "|");
            }
            ts.end();
            ts.close();
        }
    }

}
