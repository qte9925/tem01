package com.lx.dao;

import java.util.List;
import java.util.Map;

public interface lzdao {
    int lzinsetes(Map map);
    List lzselect(Map map);
    List lzdjselect(Map map);
    int lzdjupdate(Map map);
    List lzzxselect(Map map);
    int lzzxdelete(Map map);
}
