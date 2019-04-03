/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.util.lucene;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;

/**
 * Created by Administrator on 2016/5/23.
 */
public class Blog {

    private String id;

    private String title;

    private String keyWords;

    private String content;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeyWords() {
        return keyWords;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public static Document toDoc(Blog blog) {
        Document doc = new Document();
        TextField tf = new TextField("title", blog.getTitle(), Field.Store.NO);
        TextField cf = new TextField("content", blog.getContent(), Field.Store.NO);
        TextField kf = new TextField("keyWords", blog.getKeyWords(), Field.Store.NO);
        StringField idf = new StringField("id", blog.getId(), Field.Store.YES);
        doc.add(tf);
        doc.add(cf);
        doc.add(kf);
        doc.add(idf);
        return doc;
    }
}
