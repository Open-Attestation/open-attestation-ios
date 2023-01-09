//
//  OpenAttestationSpec.swift
//  OpenAttestationIOS_Tests
//
//  Created by Tan Cher Shen on 28/12/22.
//

import Quick
import Nimble
import OpenAttestationIOS
import UIKit

final class OpenAttestationSpec: QuickSpec {
    override func spec() {
        describe("OpenAttestation") {
            let sut = OpenAttestation()
            describe("verifyDocument()") {
                context("given a valid document") {
                    it("will retturn true") {
                        waitUntil(timeout: .seconds(5)) { done in
                            sut.verifyDocument(oaDocument: validDocument) { isValid in
                                expect(isValid) == true
                                done()
                            }
                        }
                    }
                }
                context("given an invalid document") {
                    it("will retturn false") {
                        waitUntil(timeout: .seconds(5)) { done in
                            sut.verifyDocument(oaDocument: invalidDocument) { isValid in
                                expect(isValid) == false
                                done()
                            }
                        }
                    }
                }
                context("given an input that is not an OpenAttestation document") {
                    it("will retturn false") {
                        waitUntil(timeout: .seconds(5)) { done in
                            sut.verifyDocument(oaDocument: "NOT AN OPENATTESTATION DOCUMENT") { isValid in
                                expect(isValid) == false
                                done()
                            }
                        }
                    }
                }
            }
        }
    }
}

let validDocument = """
{
    "version": "https://schema.openattestation.com/2.0/schema.json",
    "data": {
        "id": "e28f8a94-913b-4fa1-b8db-5611730cdb8f:string:9b7a6f31-32cc-43e9-94f3-70c80f01d0a5",
        "name": "ae95c1f6-c48f-49c7-9555-7ec1c9670bf3:string:Tan Cher Shen",
        "issueDate": "0d52c71b-a6c8-4108-b86b-3418e21f38e9:string:2022-12-31",
        "ciName": "f42584e7-dc87-47d7-8b1a-111742e52951:string:Fazdli Jamal",
        "ciSignature": "fbf4d196-e59e-43dc-a94f-7a0b219e414b:string:fazdli-jamal-signature&bd3a19338a826f4634b51ec9540cd6c044bda125bc6add929df6ef407b458bb2.png",
        "serialNumber": "e54d890c-5345-4854-8b07-c5cc7b1a3ff7:string:OBSSFA2022/001",
        "issuers": [
            {
                "name": "e1a79e88-f18f-433c-abea-d3a611620bdb:string:NATIONAL YOUTH COUNCIL STG",
                "id": "665d5057-bc58-4ca5-a907-d1c4ad24adb2:string:did:ethr:0x0bf5a2978ab6e80be903e5a65da6345cd86794b8",
                "revocation": {
                    "type": "5d43eff1-11fb-40f3-b081-4c09cbfb5252:string:REVOCATION_STORE",
                    "location": "eaff6348-22a1-400b-98f3-3e4a2639b99f:string:0xE6E022a802a547edD08761361520BC0d3bEB7784"
                },
                "identityProof": {
                    "type": "9bce3830-fbd1-4c6b-8219-cbb7446a4da9:string:DNS-DID",
                    "location": "24fcbadc-5da1-42f0-979d-6fd37e6c897b:string:national-youth-council-stg.identity.oa.gov.sg",
                    "key": "980d10bc-69ab-4b97-82ed-3394baf1f2f0:string:did:ethr:0x0bf5a2978ab6e80be903e5a65da6345cd86794b8#controller"
                }
            }
        ],
        "$template": {
            "name": "d87cb02c-94a4-4233-bc46-6429a8e764fa:string:national-youth-council/standard-first-aid",
            "type": "56eb6eb3-e932-4c01-841e-1393301cc973:string:EMBEDDED_RENDERER",
            "url": "f11290f9-e50a-45f0-a7b3-467e124d3994:string:https://national-youth-council.renderer.oa.gov.sg"
        }
    },
    "signature": {
        "type": "SHA3MerkleProof",
        "targetHash": "8de3bb0f7a2be04c73f14e900616b9f393eee911bb9a72ad989b97490c9b9066",
        "proof": [],
        "merkleRoot": "8de3bb0f7a2be04c73f14e900616b9f393eee911bb9a72ad989b97490c9b9066"
    },
    "proof": [
        {
            "type": "OpenAttestationSignature2018",
            "created": "2022-10-17T08:17:01.223Z",
            "proofPurpose": "assertionMethod",
            "verificationMethod": "did:ethr:0x0bf5a2978ab6e80be903e5a65da6345cd86794b8#controller",
            "signature": "0x060ac0302460af16801b806f5061f977c9c3deab4e1a17fbffdd249f6508870670e10f86169e48637757a99ad9e45d6eabc0b787a6cd1506efc7106f75ba1cd11b"
        }
    ]
}
"""

let invalidDocument = """
{
    "version": "https://schema.openattestation.com/2.0/schema.json",
    "data": {
        "id": "e28f8a94-913b-4fa1-b8db-5611730cdb8f:string:9b7a6f31-32cc-43e9-94f3-70c80f01d0a5",
        "name": "ae95c1f6-c48f-49c7-9555-7ec1c9670bf3:string:TAMPERED",
        "issueDate": "0d52c71b-a6c8-4108-b86b-3418e21f38e9:string:2022-12-31",
        "ciName": "f42584e7-dc87-47d7-8b1a-111742e52951:string:FAKE NAME",
        "ciSignature": "fbf4d196-e59e-43dc-a94f-7a0b219e414b:string:fazdli-jamal-signature&bd3a19338a826f4634b51ec9540cd6c044bda125bc6add929df6ef407b458bb2.png",
        "serialNumber": "e54d890c-5345-4854-8b07-c5cc7b1a3ff7:string:OBSSFA2022/001",
        "issuers": [
            {
                "name": "e1a79e88-f18f-433c-abea-d3a611620bdb:string:NATIONAL YOUTH COUNCIL STG",
                "id": "665d5057-bc58-4ca5-a907-d1c4ad24adb2:string:did:ethr:0x0bf5a2978ab6e80be903e5a65da6345cd86794b8",
                "revocation": {
                    "type": "5d43eff1-11fb-40f3-b081-4c09cbfb5252:string:REVOCATION_STORE",
                    "location": "eaff6348-22a1-400b-98f3-3e4a2639b99f:string:0xE6E022a802a547edD08761361520BC0d3bEB7784"
                },
                "identityProof": {
                    "type": "9bce3830-fbd1-4c6b-8219-cbb7446a4da9:string:DNS-DID",
                    "location": "24fcbadc-5da1-42f0-979d-6fd37e6c897b:string:national-youth-council-stg.identity.oa.gov.sg",
                    "key": "980d10bc-69ab-4b97-82ed-3394baf1f2f0:string:did:ethr:0x0bf5a2978ab6e80be903e5a65da6345cd86794b8#controller"
                }
            }
        ],
        "$template": {
            "name": "d87cb02c-94a4-4233-bc46-6429a8e764fa:string:national-youth-council/standard-first-aid",
            "type": "56eb6eb3-e932-4c01-841e-1393301cc973:string:EMBEDDED_RENDERER",
            "url": "f11290f9-e50a-45f0-a7b3-467e124d3994:string:https://national-youth-council.renderer.oa.gov.sg"
        }
    },
    "signature": {
        "type": "SHA3MerkleProof",
        "targetHash": "8de3bb0f7a2be04c73f14e900616b9f393eee911bb9a72ad989b97490c9b9066",
        "proof": [],
        "merkleRoot": "8de3bb0f7a2be04c73f14e900616b9f393eee911bb9a72ad989b97490c9b9066"
    },
    "proof": [
        {
            "type": "OpenAttestationSignature2018",
            "created": "2022-10-17T08:17:01.223Z",
            "proofPurpose": "assertionMethod",
            "verificationMethod": "did:ethr:0x0bf5a2978ab6e80be903e5a65da6345cd86794b8#controller",
            "signature": "0x060ac0302460af16801b806f5061f977c9c3deab4e1a17fbffdd249f6508870670e10f86169e48637757a99ad9e45d6eabc0b787a6cd1506efc7106f75ba1cd11b"
        }
    ]
}
"""
