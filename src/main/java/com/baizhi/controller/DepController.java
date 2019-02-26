package com.baizhi.controller;

import com.baizhi.entity.Dep;
import com.baizhi.service.DepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/dept")
public class DepController {
    @Autowired
    private DepService depService;
    @RequestMapping("/queryAll")
    public @ResponseBody Map<String,Object> queryAll(Integer page, Integer rows){
        Map<String,Object> results = new HashMap<String,Object>();
        List<Dep> byPage = depService.findByPage(page, rows);
        Long total = depService.findTotal();
        results.put("total",total);
        results.put("rows",byPage);

        return results;
    }
    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(Dep dep){
        Map<String, Object> hs = new HashMap<>();

        try {
            depService.save(dep);
            hs.put("success","添加成功");

        } catch (Exception e) {
            e.printStackTrace();
            hs.put("error","添加失败");
            hs.put("message",e.getMessage());

        }
        return hs;
    }


    @RequestMapping("/update")
    public @ResponseBody Map<String,Object> update(Dep dep){
        Map<String, Object> hs = new HashMap<>();

        try {
            depService.update(dep);
            hs.put("success","添加成功");

        } catch (Exception e) {
            e.printStackTrace();
            hs.put("error","添加失败");
            hs.put("message",e.getMessage());

        }
        return hs;
    }

    @RequestMapping("/findOne")
    public @ResponseBody Dep queryOne(String id){
        Dep dep = depService.queryOne(id);

        return dep;

    }

    @RequestMapping("/delete")
    public @ResponseBody void  delete(String id){
        depService.delete(id);

    }

    @RequestMapping("/deleteAll")
    public @ResponseBody
    Map<String,Object> deleteAll(String[] ids){
        Map<String, Object> hs = new HashMap<>();
        System.out.println(ids);
        try {
           depService.deleteAllEmp(ids);
            hs.put("success","删除成功");

        } catch (Exception e) {
            e.printStackTrace();
            hs.put("error","删除失败");
            hs.put("message",e.getMessage());

        }
        return hs;
    }
}
