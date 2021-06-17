package fr.ebook.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import fr.ebook.dao.IPublicationTextDao;
import fr.ebook.model.PublicationText;

@Repository
public class PublicationTextRepository implements IPublicationTextDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<PublicationText> findAll() {

		List<PublicationText> publications = em.createQuery("select pu from PublicationText pu", PublicationText.class)
				.getResultList();
		return publications;
	}

	@Override
	public PublicationText findById(int id) {
		// TODO Auto-generated method stub
		return em.find(PublicationText.class, id);
	}

	@Override
	@Transactional
	public PublicationText add(PublicationText entity) {
		em.persist(entity);
		return entity;
	}

	@Override
	@Transactional
	public PublicationText save(PublicationText entity) {

		if (entity.getId() > 0) {
			System.out.println("Ca passe dans le merge");
			entity = em.merge(entity);
		} else {
			System.out.println("Ca passe dans le persist");
			em.persist(entity);
		}
		return entity;
	}

	@Override
	@Transactional
	public boolean deleteById(int id) {
		try {
			em.createQuery("delete from PublicationText pu where pu.id = ?1").setParameter(1, id).executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
