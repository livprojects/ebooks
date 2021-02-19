package fr.ebook.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import fr.ebook.dao.ITypologyDao;
import fr.ebook.model.Typology;

@Repository
public class TypologyRepository implements ITypologyDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Typology> findAll() {
		List<Typology> typologies = em.createQuery("select t from Typology t", Typology.class).getResultList();
		return typologies;
	}

	@Override
	public Typology findById(int id) {
		return em.find(Typology.class, id);

	}

	@Override
	@Transactional
	public Typology add(Typology entity) {
		em.persist(entity);
		return entity;
	}

	@Override
	@Transactional
	public Typology save(Typology entity) {

		if (entity.getId() > 0) {
			entity = em.merge(entity);
		} else {
			em.persist(entity);
		}
		return entity;
	}

	@Override
	@Transactional
	public boolean deleteById(int id) {
try {
	em	.createQuery("delete from Typology t where t.id = ?1")
	.setParameter(1, id)
	.executeUpdate();
	return true;
} catch (Exception ex) {
	ex.printStackTrace();
	return false;
}
	}

}
