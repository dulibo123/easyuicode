package com.baizhi.service;

import com.baizhi.dao.DepDAO;
import com.baizhi.entity.Dep;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class DepServiceImpl implements DepService {
    @Autowired
    private DepDAO depDAO;
    @Override
    public void save(Dep dep) {
        dep.setId(UUID.randomUUID().toString());
        depDAO.save(dep);
    }

    @Override
    public void delete(String id) {
        depDAO.delete(id);
    }



    @Override
    public void update(Dep dep) {
        depDAO.update(dep);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)

    public Dep queryOne(String id) {
        return depDAO.queryOne(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)

    public void deleteAllEmp(String[] ids) {
        try {
            for (int i = 0; i < ids.length; i++) {
                String id=ids[i];
                depDAO.delete(id);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)

    public List<Dep> findByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;

        return depDAO.findByPage(start, rows);
    }

    @Override
    public Long findTotal() {

        return depDAO.findTotal();
    }
}
