package com.augus.fasion.product;

import com.augus.fasion.product.entity.BrandEntity;
import com.augus.fasion.product.service.BrandService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = FasionmallProductApplication.class)
class FasionmallProductApplicationTests {


    @Autowired
    BrandService brandService;
    @Test
    void contextLoads() {
        BrandEntity brandEntity = new BrandEntity();
        brandEntity.setName("华为");
        brandEntity.setLogo("");
        brandEntity.setDescript("");
        brandEntity.setShowStatus(0);
        brandEntity.setFirstLetter("");
        brandEntity.setSort(0);
        brandService.save(brandEntity);
        System.out.println("保存成功");

    }

}
