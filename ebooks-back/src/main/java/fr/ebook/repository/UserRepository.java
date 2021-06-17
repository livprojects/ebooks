package fr.ebook.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;
import fr.ebook.dao.IUserDao;
import fr.ebook.model.User;

@Repository
public class UserRepository implements IUserDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<User> findAll() {
		List<User> users = em.createQuery("select u from User u", User.class).getResultList();
		return users;
	}

	@Override
	public User findById(int id) {
		return em.createQuery("select u from User u where u.id = ?1", User.class).setParameter(1, id).getSingleResult();
	}
	
	@Override
	public User findByEmail(String email) {
		return em.createQuery("select u from User u where u.mail = ?1", User.class).setParameter(1, email).getSingleResult();
	}

	@Override
	@Transactional
	public User add(User entity) {
		em.persist(entity);
		return entity;
	}

	@Override
	@Transactional
	public User save(User entity) {
		if (entity.getId() > 0) {
			entity = em.merge(entity); // Sauvegarde (update)
		} else {
			em.persist(entity); // Cr�ation d'une entit�
		}
		return entity;
	}

	@Override
	@Transactional
	public boolean deleteById(int id) {


		try {

			em.createQuery("delete from User u where u.id = ?1").setParameter(1, id).executeUpdate();
			return true;

		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
