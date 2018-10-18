package com.lx.dao;
import org.springframework.stereotype.Component;

import java.util.*;
@Component
public interface reportdao {
    public List repselect(Map map);
    public List selectrep01(Map map);
    public int updaterep(Map map);
    public int insertrep(Map map);
    public int delete(Map map);
}
