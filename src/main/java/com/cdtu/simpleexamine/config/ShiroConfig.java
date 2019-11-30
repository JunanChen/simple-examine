package com.cdtu.simpleexamine.config;

import com.cdtu.simpleexamine.realm.AdminRealm;
import com.cdtu.simpleexamine.resolver.ShiroExceptionResolver;
import com.cdtu.simpleexamine.web.filter.NotLoginFilter;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerExceptionResolver;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * shiro 配置类
 *
 * @author junan
 * @since 19-5-9
 * @version 1.0.0
 */
@Configuration
public class ShiroConfig {

    /*   下面两个方法解决注解 RequiresPermissions 不起作用的问题  */
    @Bean
    public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        advisorAutoProxyCreator.setProxyTargetClass(true);
        return advisorAutoProxyCreator;
    }

    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor() {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(getDefaultWebSecurityManager());
        return authorizationAttributeSourceAdvisor;
    }

    @Bean
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Qualifier("defaultWebSecurityManager")
                                                                   DefaultWebSecurityManager securityManager){
        securityManager.setSessionManager(getSessionManager());
        ShiroFilterFactoryBean factoryBean = new ShiroFilterFactoryBean();
        factoryBean.setLoginUrl("");
        factoryBean.setSecurityManager(securityManager);
        Map<String, Filter> filters = new HashMap<>();
        filters.put("authc", getNotLoginFilter());
        Map<String,String> filterMap = new LinkedHashMap<>();
        filterMap.put("/swagger-ui.html","anon");            //开放swagger
        filterMap.put("/admin/login","anon");               //开放登录接口
        filterMap.put("/admin/logOut","anon");               //开放退出登录接口
        filterMap.put("/swagger/**","anon");
        filterMap.put("/webjars/**", "anon");
        filterMap.put("/swagger-resources/**","anon");
        filterMap.put("/v2/**","anon");
        filterMap.put("/druid/**", "anon");                   //开放druid监控
        filterMap.put("/404", "anon");                       //开放404界面
        filterMap.put("/403", "anon");                       //开放403界面
        filterMap.put("/500", "anon");                       //开放500界面
        filterMap.put("/static/**", "anon");                       //开放静态资源

        filterMap.put("/**", "authc");                       //其他url需要登录才能访问
        factoryBean.setFilterChainDefinitionMap(filterMap);
        factoryBean.setFilters(filters);
        return factoryBean;
    }

    /*
     * 凭证匹配器 （由于我们的密码校验交给Shiro的SimpleAuthenticationInfo进行处理了
     * 所以我们需要修改下doGetAuthenticationInfo中的代码; )
     */
    @Bean(name = "adminMD5Matcher")
    public HashedCredentialsMatcher hashedCredentialsMatcher() {
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        hashedCredentialsMatcher.setHashAlgorithmName("md5");// 散列算法:这里使用MD5算法;
        hashedCredentialsMatcher.setHashIterations(3);// 散列的次数，比如散列两次，相当于md5(md5(""));
        return hashedCredentialsMatcher;
    }

    /**
     * 注入DefaultWebSecurityManager
     * @return
     */
    @Bean(name = "defaultWebSecurityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager(){

        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        //关联realm
        securityManager.setRealm(getRealm());
        return securityManager;
    }

    /**
     * 注入adminRealm
     *
     * @return
     */
    @Bean
    public AdminRealm getRealm(){
        AdminRealm adminRealm = new AdminRealm();
        adminRealm.setCredentialsMatcher(hashedCredentialsMatcher());
        return new AdminRealm();
    }


    private Filter getNotLoginFilter() {
        return new NotLoginFilter();
    }

    @Bean(name = "sessionManager")
    public SessionManager getSessionManager() {
        DefaultHeaderSessionManager sessionManager = new DefaultHeaderSessionManager();
        sessionManager.setSessionDAO(new EnterpriseCacheSessionDAO());
        sessionManager.setGlobalSessionTimeout(3600000);
        sessionManager.setSessionValidationInterval(3600000);
        return sessionManager;
    }


}
