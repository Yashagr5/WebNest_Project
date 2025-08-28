package com.company.WebNest.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.WebNest.model.Task;

import jakarta.transaction.Transactional;

@Repository
public class TaskDaoImpl implements TaskDao{
	@Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    @Transactional
    public List<Task> findByAssignedUserId(Long userId) {
        return getSession()
                .createQuery("from Task where user.id = :userId", Task.class)
                .setParameter("userId", userId)
                .list();
    }

    @Override
    @Transactional
    public List<Task> findByStatus(String status) {
        return getSession()
                .createQuery("from Task where status = :status", Task.class)
                .setParameter("status", status)
                .list();
    }

    @Override
    @Transactional
    public void saveTask(Task task) {
        getSession().saveOrUpdate(task);
    }

    @Override
    @Transactional
    public Task findById(Long id) {
        return getSession().get(Task.class, id);
    }
    
    @Override
    @Transactional
    public void deleteTask(Long id) {
        Task task = findById(id);
        if (task != null) {
            getSession().delete(task);
        }
    }

    @Override
    @Transactional
    public void updateTask(Task task) {
        getSession().merge(task);  // merge is safer than update if entity is detached
    }
}
