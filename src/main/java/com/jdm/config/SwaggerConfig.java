package com.jdm.config;

import com.jdm.controller.DictController;
import org.springframework.context.annotation.*;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableSwagger2
@PropertySource("classpath:swagger.properties")
@ComponentScan(basePackageClasses = DictController.class)
@Configuration
public class SwaggerConfig {
    private static final String SWAGGER_API_VERSIOIN = "1.0";
    private static final String LICENSE_TEXT = "JDM Licencja";
    private static final String TITLE = "jobdlamuzyka.pl REST API";
    private static final String DESCRIPTION = "RESTful API dla Angulara";

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title(TITLE)
                .description(DESCRIPTION)
                .license(LICENSE_TEXT)
                .version(SWAGGER_API_VERSIOIN)
                .build();
    }

    @Bean
    public Docket productsApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .build();
    }
}
