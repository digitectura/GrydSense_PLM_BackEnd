package com.digi.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "version_files")
public class VersionFiles {

	@Id
	@Column(name = "version_file_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer versionFileId;

	private String category;

	@Column(name = "file_extension")
	private String fileExtension;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "product_version_id")
	private ProductVersions productVersions;

}
