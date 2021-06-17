package fr.ebook.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import fr.ebook.dao.IGenreDao;
import fr.ebook.model.Genre;

@Repository
public class GenreRepository implements IGenreDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Genre> findAll() {
		List<Genre> genres = em
				.createQuery("select g from Genre g", Genre.class)
				.getResultList();
		
		return genres;
	}

	@Override
	public Genre findById(int id) {
		return em.find(Genre.class, id);
	}

	@Override
	@Transactional
	public Genre add(Genre entity) {
		em.persist(entity);
		
		return entity;
	}

	@Override
	@Transactional
	public Genre save(Genre entity) {
		entity = em.merge(entity);
		
		return entity;
	}

	@Override
	@Transactional
	public boolean deleteById(int id) {
		em.createQuery("delete from Genre g where g.id = ?1")
		.setParameter(1, id)
		.executeUpdate();
		
		return true;
	}

}
