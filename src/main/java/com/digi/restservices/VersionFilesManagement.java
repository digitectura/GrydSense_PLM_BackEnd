package com.digi.restservices;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.digi.domain.ProductVersions;
import org.springframework.web.multipart.MultipartFile;
import com.digi.domain.VersionFiles;
import com.digi.repository.ProductVersionsRepository;
import com.digi.repository.VersionFilesRepository;

@RestController
@RequestMapping("version-file-management")
public class VersionFilesManagement {

	@Value("${apache.tomcat.webGL.project.path}")
	private String prefixPath;

	@Autowired
	private ProductVersionsRepository productVersionsRepository;

	@Autowired
	private VersionFilesRepository versionFilesRepository;

	@GetMapping("/{productVersionId}")
	private ResponseEntity<?> getAllVersionFiles(@PathVariable Integer productVersionId) {
		ProductVersions productVersionObj = productVersionsRepository.findByProductVersionId(productVersionId);
		if (productVersionObj != null) {
			List<VersionFiles> versionFiles = versionFilesRepository.findByProductVersions(productVersionObj);
			return ResponseEntity.status(HttpStatus.OK).body(versionFiles);
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("product not found");
		}
	}

	@PostMapping("/{productVersionId}")
	private ResponseEntity<?> getAllProductVersions(@PathVariable Integer productVersionId,
			@RequestParam(name = "category") String category, @RequestParam("fileUpload") MultipartFile[] multipartFile)
			throws IllegalStateException, IOException {
		ProductVersions productVersionObj = productVersionsRepository.findByProductVersionId(productVersionId);
		if (productVersionObj != null) {
			VersionFiles versionFileObj = new VersionFiles();
			versionFileObj = versionFilesRepository.findByProductVersionsAndCategory(productVersionObj, category);
			if (versionFileObj == null) {
				versionFileObj = new VersionFiles();
				versionFileObj.setCategory(category);
				versionFileObj.setProductVersions(productVersionObj);
				String tt = multipartFile[0].getOriginalFilename();
				String extension = FilenameUtils.getExtension(tt);
				versionFileObj.setFileExtension(extension);
				versionFileObj = versionFilesRepository.saveAndFlush(versionFileObj);
				String filePath = prefixPath + versionFileObj.getVersionFileId() + "." + extension;
				File file = new File(filePath);
				multipartFile[0].transferTo(file);
			}
			return ResponseEntity.status(HttpStatus.OK).body("saved");
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("product not found");
		}
	}

	@DeleteMapping("/{versionFileId}")
	private ResponseEntity<?> deleteVersionFiles(@PathVariable Integer versionFileId) {
		VersionFiles versionFileObj = versionFilesRepository.findById(versionFileId).get();
		if (versionFileObj != null) {
			String filePath = prefixPath + versionFileObj.getVersionFileId() + "." + versionFileObj.getFileExtension();
			File file = new File(filePath);
			if (file.exists()) {
				file.delete();
			}
			versionFilesRepository.delete(versionFileObj);
			return ResponseEntity.status(HttpStatus.OK).body("deleted");
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("product not found");
		}
	}

	@GetMapping("/download/{versionFileId}")
	private ResponseEntity<?> getFile(@PathVariable Integer versionFileId) throws IOException {
		VersionFiles versionFileObj = versionFilesRepository.findById(versionFileId).get();
		if (versionFileObj != null) {
			String filePath = prefixPath + versionFileObj.getVersionFileId() + "." + versionFileObj.getFileExtension();
			File file = new File(filePath);
			HttpHeaders headers = new HttpHeaders();
			ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(FileUtils.readFileToByteArray(file));
			headers.add("Content-Disposition", "attachment; filename=data." + versionFileObj.getFileExtension());
			return ResponseEntity.ok().headers(headers).body(new InputStreamResource(byteArrayInputStream));
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("product not found");
		}
	}

}
