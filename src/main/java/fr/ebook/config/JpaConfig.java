package fr.ebook.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories("fr.ebook.dao")
public class JpaConfig {

	@Bean 
	public DataSource dataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		
		// Data source -> Import Sql 
		
		// Configuration de la source de données 
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/dbbooks?serverTimezone=UTC");
		dataSource.setUsername("root");
		dataSource.setPassword("Oradour75025-");
		// Nombre de connexions simultanées 
		dataSource.setMaxTotal(10);
		
		return dataSource;
	}
	
	@Bean 
	public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource) {
		LocalContainerEntityManagerFactoryBean emf = new LocalContainerEntityManagerFactoryBean();
		
		// Préparation des propertis Hibernate (pas obligatoire) 
		Properties properties = new Properties();
		
		
		// Configuration de l'EntityManagerFactory 
		emf.setDataSource(dataSource);
		emf.setPackagesToScan("fr.ebook.model");
		// On lui indique qu'on utilise Hibernate
		emf.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
		
		// Préparation des properties Hibernate (pas obligatoire) 
		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
		properties.setProperty("hibernate.show_sql", "true");
		
		// On donne ces properties à l'EntityManagerFactory 
		emf.setJpaProperties(properties);
		
		return emf;
	}
	
	@Bean
	
	public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		
		// Configuration du gestionnaire de transaction 
		transactionManager.setEntityManagerFactory(emf);
		
		return transactionManager;
	
	}
	
	@Bean
	public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}
	
}
