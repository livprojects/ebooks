package fr.ebook.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import fr.ebook.dao.IInstitutionDao;
import fr.ebook.model.Genre;
import fr.ebook.model.Institutions;

@Repository
public class InstitutionRepository implements IInstitutionDao {
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Institutions> findAll() {
		return em.createQuery("select i from Institutions i", Institutions.class)
				.getResultList();
	}

	@Override
	@Transactional
	public Institutions findById(int id) {
		return em.find(Institutions.class, id);
	}

	@Override
	@Transactional
	public Institutions add(Institutions entity) {
		em.persist(entity);
		
		return entity;
	}

	@Override
	@Transactional
	public Institutions save(Institutions entity) {
		if(entity.getId() > 0) {
			entity = em.merge(entity);
		} 
		
		else {
			em.persist(entity);
		}
		
		return entity;
	}

	@Override
	@Transactional
	public boolean deleteById(int id) {
		Institutions institutions = new Institutions();
		
		institutions.setId(id);
		
		try {
			em
			.createQuery("delete from Institutions i where i.id = ?1")
			.setParameter(1, id)
			.executeUpdate();
			
			return true;
		}
		
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}



}
