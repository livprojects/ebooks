package fr.ebook.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import fr.ebook.dao.IPublicationDetailsDao;
import fr.ebook.model.PublicationDetails;


@Repository
public class PublicationDetailsRepository implements IPublicationDetailsDao {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<PublicationDetails> findAll() {
		List<PublicationDetails> publications = em
				.createQuery("select p from PublicationDetails p", PublicationDetails.class)
				.getResultList();
		
		return publications;
	}

	@Override
	public PublicationDetails findById(int id) {
		return em.find(PublicationDetails.class, id);
	}

	@Override
	@Transactional
	public PublicationDetails add(PublicationDetails entity) {
		em.persist(entity);
		
		return entity;
	}

	@Override
	@Transactional
	public PublicationDetails save(PublicationDetails entity) {
		if (entity.getId() > 0) { //UPDATE
			entity = em.merge(entity);
		}
		
		else { //INSERT
			em.persist(entity);
		}
		
		return entity;
	}

	@Override
	@Transactional
	public boolean deleteById(int id) {
		try {
			em	.createQuery("delete from PublicationDetails p where p.id = ?1")
				.setParameter(1, id)
				.executeUpdate();
			
			return true;
		}
		
		catch (Exception ex) {
			return false;
		}
	}
	
}