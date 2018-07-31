package com.projectMatrix.configration;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.SimpleUrlHandlerMapping;
import org.springframework.web.servlet.mvc.UrlFilenameViewController;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@ComponentScan(basePackages = "com.projectMatrix")
@EnableWebMvc
@EnableTransactionManagement
@PropertySource(value = "/WEB-INF/Properties/db.properties")
public class ApplicationContextConfig extends WebMvcConfigurerAdapter {

    @Autowired
    Environment environment;

    @Autowired
    private RequestProcessingTimeInterceptor localeInterceptor;

   /* @Bean
    public static PropertySourcesPlaceholderConfigurer placeholderConfigurer() {
        PropertySourcesPlaceholderConfigurer c = new PropertySourcesPlaceholderConfigurer();
        c.setLocations(new ClassPathResource("smartApp.properties"));
        c.setIgnoreUnresolvablePlaceholders(true);
        return c;
    }*/

    @Override
    public void addInterceptors(final InterceptorRegistry registry) {
        registry.addInterceptor(localeInterceptor);
    }

    
    
    
    
    @Override
    public void addResourceHandlers(final ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");

    }

    public void addResourceHandlers1(final ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/").setCachePeriod(31556926);
        registry.addResourceHandler("/css/**").addResourceLocations("/css/").setCachePeriod(31556926);
        registry.addResourceHandler("/img/**").addResourceLocations("/img/").setCachePeriod(31556926);
        registry.addResourceHandler("/js/**").addResourceLocations("/js/").setCachePeriod(31556926);
    }

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(environment.getRequiredProperty("jdbc.driverClassName"));
        dataSource.setUrl(environment.getRequiredProperty("jdbc.url"));
        dataSource.setUsername(environment.getRequiredProperty("jdbc.username"));
        dataSource.setPassword(environment.getRequiredProperty("jdbc.password"));
        return dataSource;
    }

  
   /* @Autowired
    @Bean(name = "hibernateTemplate")
    public HibernateTemplate getHibernateTemplate(final SessionFactory sessionFactory) {
        HibernateTemplate hibernateTemplate = new HibernateTemplate(getSessionFactory());
        return hibernateTemplate;
    }*/

    @Autowired
    @Bean(name = "sessionFactory")
    public SessionFactory getSessionFactory() {
        LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource());
        sessionBuilder.addProperties(hibernateProperties());
        sessionBuilder.scanPackages("com.projectMatrix");
        return sessionBuilder.buildSessionFactory();
    }

    
    
    
    // for both url and internal 1
    @Bean
    public SimpleUrlHandlerMapping getUrlHandlerMapping() {
        SimpleUrlHandlerMapping handlerMapping = new SimpleUrlHandlerMapping();
        Properties mappings = new Properties();

        mappings.put("/**/*.jsp", "urlViewController");

        handlerMapping.setMappings(mappings);
        return handlerMapping;
    }

    @Bean(name = "viewResolver")
    public InternalResourceViewResolver getViewResolver() {

        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setSuffix(".jsp");
        viewResolver.setOrder(2);
        return viewResolver;
    }

    // for both urlviewResolver  and  InternalResource  viewResolver
    @Bean(name = "urlViewController")
    public UrlFilenameViewController getUrlViewController() {
        UrlFilenameViewController urlViewController = new UrlFilenameViewController();
        return urlViewController;
    }

    private Properties hibernateProperties() {
        Properties properties = new Properties();
        properties.put("hibernate.dialect", environment.getRequiredProperty("hibernate.dialect"));
        properties.put("hibernate.show_sql", environment.getRequiredProperty("hibernate.show_sql"));
        properties.put("hibernate.enable_lazy_load_no_trans", "true");
        //        properties.put("hibernate.hbm2ddl.auto", environment.getRequiredProperty("hibernate.hbm2ddl.auto"));
        return properties;
    }

    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("messages");
        return messageSource;
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setDefaultEncoding("utf-8");
        return resolver;
    }

     @Bean
     public LocalSessionFactoryBean sessionFactory() {
         LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
         sessionFactory.setDataSource(dataSource());
         sessionFactory.setPackagesToScan(new String[] { "com.projectMatrix" });
         sessionFactory.setHibernateProperties(hibernateProperties());
         return sessionFactory;
     }

    // tiles related
  /*  @Bean
    TilesConfigurer tilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions("WEB-INF/tiles/**");
        tilesConfigurer.setPreparerFactoryClass(org.springframework.web.servlet.view.tiles3.SpringBeanPreparerFactory.class);
        return tilesConfigurer;
    }
*/
    @Autowired
    @Bean(name = "transactionManager")
    public HibernateTransactionManager transactionManager(final SessionFactory s) {
        HibernateTransactionManager txManager = new HibernateTransactionManager();
        txManager.setSessionFactory(s);
        return txManager;
    }

    //    tiles  related
   /* @Bean
    TilesViewResolver viewResolver() {
        TilesViewResolver viewResolver = new TilesViewResolver();
        return viewResolver;
    }*/

    /*@Bean
    public XmlViewResolver xmlViewResolver() {
        XmlViewResolver resolver = new XmlViewResolver();
        Resource resource = new ClassPathResource("views.xml");
        resolver.setOrder(0);
        resolver.setLocation(resource);
        return resolver;
    }*/
}